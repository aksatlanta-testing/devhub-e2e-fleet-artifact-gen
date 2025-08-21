
{{- define "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.fullname" -}}
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


{{- define "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.labels" -}}
helm.sh/chart: {{ include "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.chart" . }}
{{ include "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof15ce953-fc4b-4fb2-8ddb-c8df3ff9aeba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}