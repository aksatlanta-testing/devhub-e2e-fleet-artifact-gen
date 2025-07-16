
{{- define "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.fullname" -}}
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


{{- define "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.labels" -}}
helm.sh/chart: {{ include "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.chart" . }}
{{ include "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae82c1c3-f4a4-4faa-9267-6aca30df728d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}