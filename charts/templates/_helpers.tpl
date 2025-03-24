
{{- define "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.fullname" -}}
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


{{- define "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.labels" -}}
helm.sh/chart: {{ include "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.chart" . }}
{{ include "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof503c8f5-c2f7-49b7-a446-e212c9dbdc2d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}