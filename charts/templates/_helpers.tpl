
{{- define "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.fullname" -}}
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


{{- define "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.labels" -}}
helm.sh/chart: {{ include "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.chart" . }}
{{ include "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9f3127a1-8a82-49fc-9bce-90efc60abcca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}