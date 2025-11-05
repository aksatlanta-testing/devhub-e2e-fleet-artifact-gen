
{{- define "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.fullname" -}}
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


{{- define "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.labels" -}}
helm.sh/chart: {{ include "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.chart" . }}
{{ include "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc32ffbbb-0f03-42c5-8935-c39e46ce38cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}