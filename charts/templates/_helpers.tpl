
{{- define "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.fullname" -}}
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


{{- define "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.labels" -}}
helm.sh/chart: {{ include "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.chart" . }}
{{ include "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefced3e2-e86b-4f43-a6dc-04a95a71bfa7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}