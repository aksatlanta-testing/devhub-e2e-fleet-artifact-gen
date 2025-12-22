
{{- define "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.fullname" -}}
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


{{- define "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.labels" -}}
helm.sh/chart: {{ include "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.chart" . }}
{{ include "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo990d65b6-a40e-4ee9-a02c-1d7fa700e439.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}