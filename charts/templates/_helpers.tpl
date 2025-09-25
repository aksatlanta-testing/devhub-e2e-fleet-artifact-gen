
{{- define "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.fullname" -}}
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


{{- define "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.labels" -}}
helm.sh/chart: {{ include "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.chart" . }}
{{ include "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8bdd0f9-b85b-44dc-ac4f-e950fcbd2bed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}