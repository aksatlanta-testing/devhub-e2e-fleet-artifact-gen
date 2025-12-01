
{{- define "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.fullname" -}}
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


{{- define "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.labels" -}}
helm.sh/chart: {{ include "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.chart" . }}
{{ include "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7fd7acb4-2653-4cf1-b77a-7435d26a8bdd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}