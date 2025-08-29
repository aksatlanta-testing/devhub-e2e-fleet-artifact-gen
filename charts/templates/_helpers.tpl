
{{- define "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.fullname" -}}
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


{{- define "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.labels" -}}
helm.sh/chart: {{ include "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.chart" . }}
{{ include "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8faca39-8df9-46b2-9e86-42dbd782c70d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}