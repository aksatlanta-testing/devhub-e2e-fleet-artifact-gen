
{{- define "go-echof702b448-5316-4627-adbc-0e1597bbd78b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof702b448-5316-4627-adbc-0e1597bbd78b.fullname" -}}
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


{{- define "go-echof702b448-5316-4627-adbc-0e1597bbd78b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof702b448-5316-4627-adbc-0e1597bbd78b.labels" -}}
helm.sh/chart: {{ include "go-echof702b448-5316-4627-adbc-0e1597bbd78b.chart" . }}
{{ include "go-echof702b448-5316-4627-adbc-0e1597bbd78b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof702b448-5316-4627-adbc-0e1597bbd78b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof702b448-5316-4627-adbc-0e1597bbd78b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}