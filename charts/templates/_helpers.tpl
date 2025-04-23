
{{- define "go-echo314bad10-7042-484e-9fac-7458a23f53df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo314bad10-7042-484e-9fac-7458a23f53df.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo314bad10-7042-484e-9fac-7458a23f53df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo314bad10-7042-484e-9fac-7458a23f53df.labels" -}}
helm.sh/chart: {{ include "go-echo314bad10-7042-484e-9fac-7458a23f53df.chart" . }}
{{ include "go-echo314bad10-7042-484e-9fac-7458a23f53df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo314bad10-7042-484e-9fac-7458a23f53df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo314bad10-7042-484e-9fac-7458a23f53df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}