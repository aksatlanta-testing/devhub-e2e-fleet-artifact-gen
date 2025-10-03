
{{- define "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.fullname" -}}
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


{{- define "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.labels" -}}
helm.sh/chart: {{ include "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.chart" . }}
{{ include "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe4c41a0-d921-46ab-b603-b4fc796a11fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}