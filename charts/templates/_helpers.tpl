
{{- define "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.fullname" -}}
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


{{- define "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.labels" -}}
helm.sh/chart: {{ include "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.chart" . }}
{{ include "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo58d67b86-521e-4c4c-a78c-24f36a5649cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}