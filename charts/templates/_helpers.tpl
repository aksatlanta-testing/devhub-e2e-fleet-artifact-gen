
{{- define "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.fullname" -}}
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


{{- define "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.labels" -}}
helm.sh/chart: {{ include "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.chart" . }}
{{ include "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d0624b8-cd1a-4c1d-8163-d61afcd35bca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}