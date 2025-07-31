
{{- define "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.fullname" -}}
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


{{- define "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.labels" -}}
helm.sh/chart: {{ include "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.chart" . }}
{{ include "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeaf6129f-303b-48e2-8708-eefb930e0f12.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}