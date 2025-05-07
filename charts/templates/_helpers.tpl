
{{- define "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.fullname" -}}
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


{{- define "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.labels" -}}
helm.sh/chart: {{ include "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.chart" . }}
{{ include "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4d2aacc2-1e4f-4741-8789-4cdb53b17899.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}