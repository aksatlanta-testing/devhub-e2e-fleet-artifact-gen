
{{- define "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.fullname" -}}
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


{{- define "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.labels" -}}
helm.sh/chart: {{ include "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.chart" . }}
{{ include "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa772443-6fc9-4b43-87f5-11be4c6fbaeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}